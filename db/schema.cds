namespace com.logali;

// Type personalizado: no recomendado por SAP
type Name              : String(50);

// Type estructurado:
type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

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

type Dec: Decimal(16,2);
entity Products {
    key ID               : UUID;
        Name             : String; // default 'NoName';
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        //CreationDate     : Date default CURRENT_DATE;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);

}

// Tipo 1: sin estructuras entity plano
entity Suppliers {
    key ID      : UUID;
        // Name    : type of Products:Name; //String;
        Name    : Products:Name; //String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;

};

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

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvalability {
    key ID          : Integer;
        Description : String;
}

entity Currencies {
    key ID          : String(3);
        Description : String;
}

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
}

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
}

entity Months {
    key ID               : String(2);
        Description      : String;
        shortdescription : String(3);
}

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
}

entity SalesData {
    key ID           : UUID;
        Deliverydate : DateTime;
        Revenue      : Decimal(16, 2);

}
