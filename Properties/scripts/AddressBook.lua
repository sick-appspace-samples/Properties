--[[----------------------------------------------------------------------------

  Application Name: Properties

  Description:
  Introduction to creating CROWN data structures with Properties for handling complex data.

  In this sample a new data type, called "Address", is declared via App Properties dialog.
  This data type has "Properties", which are basically a pair of get()/set()-Functions
  which are automatically implemented at declaration point. The set() function stores
  data, the get() function retrieves it later. It can be compared to declaration of
  structs in C. Main reason for Crowns with Properties is to provide new compound
  data types for inter-app data exchange. This file offers functionality of an
  address book, where "Address" data items can be stored (a Lua list of Address items).
  The file "AddressBookClient.lua" then uses the AddressBook as client to add some
  Address instances and to print them out.

 ------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------
local client = require('AddressBookClient')


-- Serving the event raised when new addresses were added
Script.serveEvent( 'AddressBook.OnAddressAdded', 'AddressAdded')

-- The table of Addresses. This is the storage where the AddressBook stores its items
local addresses = {}

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

-- This function is called when the Engine.OnStarted event is raised.
local function handleOnStarted()
  -- Start the client so it can work with the address book
  client.executeClient()
end
Script.register('Engine.OnStarted', handleOnStarted)

-- Provides an additional function for the "Address" data type. The rest
-- of the functionality of "Address" is just declared in the App Properties.
--@addressToString(addr:Address):string
local function addressToString(addr)
  local str = addr:getFirstName() ..
    ' ' .. addr:getLastName() ..
    ', ' .. addr:getStreet() ..
    ', ' .. addr:getZip() ..
    ' ' .. addr:getCity()
  return str
end
Script.serveFunction('Address.toString', addressToString)

-- The function the client can call to add new addresses to the book
local function addressBookAdd(addr)
  table.insert(addresses, addr)
  Script.notifyEvent('AddressAdded', addr)
end
Script.serveFunction('AddressBook.add', addressBookAdd)

--End of Function and Event Scope------------------------------------------------
