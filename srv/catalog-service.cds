using {com.logali as logali} from '../db/schema';

service CatalogService {
    entity ProductsSrv as projection on logali.Products;
    entity CategoriesSrv as projection on logali.Categories;

}
