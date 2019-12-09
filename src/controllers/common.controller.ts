import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {Interest, Scenario, Product} from '../models';
import {ProductRepository} from '../repositories';
import {inject} from '@loopback/testlab';
import {PostgresqlDataSource} from '../datasources';

export class CommonController {
  constructor(
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {}

  /**
   * Function that checks if {Product} exists by looking up its name
   * @param productname Name of the {Product} that wants to be checked
   * @returns {Promise<number>} Returns a {Promise<number>}, being the number the ID of the product found. If the product does not exist, it will return -1
   */
  async checkProduct(productname: string): Promise<number> {
    const product = await this.productRepository.findOne({
      where: {
        name: productname,
      },
    });
    const r: Promise<number> = new Promise(resolve => {
      const productid = !!product && !!product.id ? product.id : -1;
      resolve(productid);
    });
    return r;
  }

  initializeFilter(type: string): Filter<any> {
    let r;
    switch (type.toLowerCase()) {
      case 'interest':
        r = new FilterBuilder<Interest>().build();
        break;
      case 'scenario':
        r = new FilterBuilder<Scenario>().build();
        break;
      case 'product':
        r = new FilterBuilder<Product>().build();
        break;
      default:
        r = new FilterBuilder<any>().build();
    }
    return r;
  }
}
