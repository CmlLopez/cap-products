namespace com.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';

//uSAR CUID;
// Type personalizado: no recomendado por SAP
type Name : String(50);

// Type estructurado:
type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

type Dec  : Decimal(16, 2);

entity Products : cuid, managed {
    // key ID               : UUID;
    Name             : localized String not null; // default 'NoName';
    Description      : localized String;
    ImageUrl         : String;
    ReleaseDate      : DateTime default $now;
    //CreationDate     : Date default CURRENT_DATE;
    DiscontinuedDate : DateTime;
    Price            : Dec;
    Height           : type of Price; //Decimal(16, 2);
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
    Supplier         : Association to Suppliers;
    UnitOfMeasure    : Association to UnitOfMeasures;
    Currency         : Association to Currencies;
    DimensionUnit    : Association to DimensionUnits;
    Category         : Association to Categories;
    ToSalesData      : Association to many SalesData
                           on ToSalesData.Product = $self;
    Reviews          : Association to many ProductReview
                           on Reviews.Product = $self;
}

entity Orders {
    key ID       : UUID;
        Date     : Date;
        Customer : String;
        Item     : Composition of OrderItems;
};

entity OrderItems {
    key ID       : UUID;
        Order    : Association to Orders;
        Product  : Association to Products;
        Quantity : Integer;
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
        Product : Association to many Products
                      on Product.Supplier = $self;

};


entity Categories {
    key ID   : String(1);
        Name : localized String;
};

entity StockAvalability {
    key ID          : Integer;
        Description : localized String;
        Product     : Association to Products;
}

entity Currencies {
    key ID          : String(3);
        Description : localized String;
}

entity UnitOfMeasures {
    key ID          : String(2);
        Description : localized String;
}

entity DimensionUnits {
    key ID          : String(2);
        Description : localized String;
}

entity Months {
    key ID               : String(2);
        Description      : localized String;
        shortdescription : String(3);
}

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : localized String;
        Product : Association to Products;

}

entity SalesData {
    key ID            : UUID;
        DeliveryDate  : DateTime;
        Revenue       : Decimal(16, 2);
        Product       : Association to Products;
        Currency      : Association to Currencies;
        DeliveryMonth : Association to Months;
}

entity SelProducts   as select from Products;

entity SelProducts1  as
    select Name from Products
    where
        Name like '%Soda%';

entity SelProducts3  as
    select from Products
    left join ProductReview
        on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(Price) as TotalPrice
    }
    group by
        Rating,
        Products.Name
    order by
        Rating;

entity ProjProducts  as projection on Products;

entity ProjProducts2 as
    projection on Products {
        *
    };

entity ProjProducts3 as
    projection on Products {
        ReleaseDate,
        Name
    };


extend Products with {
    PriceCondition     : String(2);
    PriceDetermination : String(3);
};

entity Course : cuid, managed {
    Name : String;

};
