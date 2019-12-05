import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Interest, InterestRelations, Product} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';

export class InterestRepository extends DefaultCrudRepository<
  Interest,
  typeof Interest.prototype.id,
  InterestRelations
> {

  public readonly product: BelongsToAccessor<Product, typeof Interest.prototype.id>;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource, @repository.getter('ProductRepository') protected productRepositoryGetter: Getter<ProductRepository>,
  ) {
    super(Interest, dataSource);
    this.product = this.createBelongsToAccessorFor('product', productRepositoryGetter,);
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
