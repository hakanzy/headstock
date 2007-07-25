#!/usr/bin/env python
# -*- coding: utf-8 -*-

from Axon.Component import component
from Axon.Ipc import shutdownMicroprocess, producerFinished

from headstock.protocol.core.stanza import Stanza
from headstock.api.contact import Presence

from bridge import Element as E
from bridge import Attribute as A
from bridge.common import XMPP_CLIENT_NS

__all__ = ['PresenceDispatcher']

class PresenceDispatcher(component):
    Inboxes = {"inbox"              : "bridge.Element instance",
               "control"            : "Shutdown the client stream",
               "forward"            : "headstock.api.contact.Presence instance to be sent back to the client. Transforms the instance to a bridge.Element instance and puts it into the 'outbox'",
               }
    
    Outboxes = {"outbox"            : "bridge.Element instance to sent back to the client",
                "signal"            : "Shutdown signal",
                "unknown"           : "Unknown element that could not be dispatched properly",
                "xmpp.error"        : "An error has occurred regarding processing or delivery of a presence stanza",
                "xmpp.probe"        : "Server to server message to check the presence of an entity",
                "xmpp.subscribe"    : "Sender wishes to subscribe to the recipient's presence",
                "xmpp.subscribed"   : "Sender has allowed the recipient to receive their presence",
                "xmpp.unsubscribe"  : "Sender is unsubscribing from another entity's presence",
                "xmpp.unsubscribed" : "Subscription request has been denied or a previously-granted subscription has been cancelled"
                }
    
    def __init__(self):
       super(PresenceDispatcher, self).__init__() 

    def main(self):
        while 1:
            if self.dataReady("control"):
                mes = self.recv("control")
                
                if isinstance(mes, shutdownMicroprocess) or isinstance(mes, producerFinished):
                    self.send(producerFinished(), "signal")
                    break

            if self.dataReady("forward"):
                p = self.recv("forward")
                self.send(Presence.to_element(p), "outbox")

            if self.dataReady("inbox"):
                e = self.recv("inbox")
                presence_type = e.get_attribute(u'type')
                handled = False
                if presence_type:
                    key = 'xmpp.%s' % presence_type
                    if key in self.outboxes:
                        c = Presence.from_element(e)
                        self.send(c, key)
                        handled = True

                if not handled:
                    self.send(e, "unknown")

            if not self.anyReady():
                self.pause()
  
            yield 1
