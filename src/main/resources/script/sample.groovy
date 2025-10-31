package src.main.resources.script

import com.sap.gateway.ip.core.customdev.util.Message

def Message processData(Message message) {

    message.setProperty("test",1)

    return message
}