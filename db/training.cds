namespace com.training;

// type EmailAddresses_01 : many {
//     kind  : String;
//     email : String
// };

// type EmailAddresses_02 {
//     kind  : String;
//     email : String
// };

// entity Emails {
//     email_01 : EmailAddresses_01;
//     email_02 : many EmailAddresses_02;
//     email_03 : many {
//         kind  : String;
//         email : String
//     };

// };

// type Gender: String enum {
//     mame;
//     female;
// }

// entity  Order {
//     clientGender: Gender;
//     status: Integer enum{
//         Submitted = 1;
//         fullfiller = 2;
//         shipped = 3;
//         cancel = -1;
//     };
//     priority: String @assert.range enum{
//         high;
//         medium;
//         low;
//     };
// };

// entity Cars{
//     key ID : UUID;
//     Name: String;
//     virtual Discount_1: Decimal;
//     @Core.Computed : false
//     virtual Discount_2: Decimal;

// };

// Tipo 2: LLamando a estructuras definidas en línea 7
entity Suppliers_01 {
    key ID      : UUID;
        Name    : String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;

};

// Tipo 3 (inner Type): Se declara la estructura dentro del entity (pooco usado)
entity Suppliers_02 {
    key ID      : UUID;
        Name    : String;
        Address : {
            Street     : String;
            City       : String;
            State      : String(2);
            PostalCode : String(5);
            Country    : String(3);

        };
        Email   : String;
        Phone   : String;
        Fax     : String;

};

/*
entity ParamProducts (pName: String) as
    select from Products {
        Name,
        Price,
        Quantity
    }
    where
        Name = : pName;

 entity ProjParamProducts (pName : String) as projection on Products where Name = : pName;
 */
