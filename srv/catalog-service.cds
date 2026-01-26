using {com.logali as logali} from '../db/schema';

service CatalogService {
    entity ProductsSrv as projection on logali.Products;
    entity CategoriesSrv as projection on logali.Categories;
    entity SuppliersSrv as projection on logali.Suppliers;
    entity SelProductsSrv as projection on logali.SelProducts;
    //entity Suppliers_01 as projection on logali.Suppliers_01;
    //entity Suppliers_02 as projection on logali.Suppliers_02;
    // entity Cars as projection on logali.Cars


}
