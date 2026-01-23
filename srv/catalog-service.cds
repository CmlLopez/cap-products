using {com.logali as logali} from '../db/schema';

service CatalogService {
    entity ProductsSrv as projection on logali.Products;
    entity CategoriesSrv as projection on logali.Categories;
    entity Suppliers as projection on logali.Suppliers;
    entity Suppliers_01 as projection on logali.Suppliers_01;
    entity Suppliers_02 as projection on logali.Suppliers_02;


}
