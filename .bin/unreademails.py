import imaplib
import os
import sys
import imp

# User home variable
home = os.environ["HOME"]
sys.path.insert(0, home + '/.config/custom')

try:
    imp.find_module('emailconfig')
    import emailconfig
    configExists = True
except ImportError:
    configExists = False

if configExists is False:
    print 0
    sys.exit(1)

mail = imaplib.IMAP4_SSL('imap.gmail.com')
mail.login(emailconfig.user['name'], emailconfig.user['password'])
mail.select()
unreadEmails = mail.search(None, 'UnSeen')

# Print number of unseen email conversations
print len(unreadEmails[1][0].split())
