## Properties
Introduction to creating CROWN data structures with Properties for handling complex data
### Description
In this sample a new data type, called "Address", is declared via App Properties dialog.
This data type has "Properties", which are basically a pair of get()/set()-Functions
which are automatically implemented at declaration point. The set() function stores
data, the get() function retrieves it later. It can be compared to declaration of
structs in C. Main reason for Crowns with Properties is to provide new compound
data types for inter-App data exchange. This file offers functionality of an
address book, where "Address" data items can be stored (a Lua list of Address items).
The file "AddressBookClient.lua" then uses the AddressBook as client to add some
Address instances and to print them out

### Topics
Programming-Pattern, Sample, SICK-AppSpace