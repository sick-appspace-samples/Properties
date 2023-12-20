--[[----------------------------------------------------------------------------
  In this script new entries for the Address book will be created. Furthermore
  it will react to an event which is raised when new addresses are created in the
  address book.
------------------------------------------------------------------------------]]

---Event handler for the "OnAddressAdded" event
---@param addr Address
local function displayAddedAddress(addr)
  print('New address added: ' .. addr:toString())
end
Script.register('AddressBook.OnAddressAdded', displayAddedAddress)

---Client functionality. Add two addresses; the AddressBook will then raise an event two times, which will trigger the event handler "displayAddedAddress".
local function executeClient()
  local addr1 = Address.create()
  addr1:setFirstName('Johann Sebastian')
  addr1:setLastName('Bach')
  addr1:setStreet('Frauenplan 21')
  addr1:setZip(99817)
  addr1:setCity('Eisenach')
  AddressBook.add(addr1)

  local addr2 = Address.create()
  addr2:setFirstName('Wolfgang Amadeus')
  addr2:setLastName('Mozart')
  addr2:setStreet('Getreidegasse 9')
  addr2:setZip(5020)
  addr2:setCity('Salzburg')
  AddressBook.add(addr2)
end

---Return local function to be used in Address book script
local fnc = {}
fnc.executeClient = executeClient
return fnc
