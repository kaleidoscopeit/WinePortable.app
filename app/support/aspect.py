#!/usr/bin/env python

import pygtk
import gtk
import os
from tempfile import NamedTemporaryFile
from gconf import Client
import re

# Create a window to scrape colors from
window = gtk.Window()
vbox = gtk.VBox()
menubar = gtk.MenuBar()
menuitem = gtk.MenuItem('test')
scrolled = gtk.ScrolledWindow()
text = gtk.TextView()

menubar.add(menuitem)
vbox.add(menubar)

scrolled.add(text)
vbox.add(scrolled)

window.add(vbox)

#tooltip = gtk.Window()
#tooltip.set_name('gtk-tooltips')
#tooltip.show_all()

window.show_all()

# pack the scrolled window into a simple dialog and run it
#dialog = gtk.Dialog('IconView Demo')
#close = dialog.add_button(gtk.STOCK_CLOSE, gtk.RESPONSE_NONE)
#dialog.set_default_size(4,4)
#dialog.run()


menuheight = menubar.allocation.height - 1

# Fix until I'll find a coherent solution to grab menu height with the GTK3
menuheight = 20

try:
    wineprefix = os.environ['WINEPREFIX']
except KeyError:
    wineprefix = os.path.join(os.environ['HOME'],'.wine')

#f = open( 'temp.reg', 'a')
f = open( 'support/temp.reg', 'a')
f.write("""
[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
"MenuHeight"=\"""" + str(menuheight) + """\"
"MenuWidth"=\"-270\"
"ScrollHeight"=\"""" + str(scrolled.get_hscrollbar().allocation.height) + """\"
"ScrollWidth"=\"""" + str(scrolled.get_vscrollbar().allocation.width) + """\"
""")

f.flush()
f.close()

