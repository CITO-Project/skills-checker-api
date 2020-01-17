import {
  DefaultCrudRepository,
  repository,
  BelongsToAccessor,
} from '@loopback/repository';
import {Interest, InterestRelations, Product, Category} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';
import {CategoryRepository} from '.';

export class InterestRepository extends DefaultCrudRepository<
  Interest,
  typeof Interest.prototype.id,
  InterestRelations
> {
  public readonly product: BelongsToAccessor<
    Product,
    typeof Interest.prototype.id
  >;

  public readonly category: BelongsToAccessor<
    Category,
    typeof Interest.prototype.id
  >;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource,
    @repository.getter('ProductRepository')
    protected productRepositoryGetter: Getter<ProductRepository>,
    @repository.getter('CategoryRepository')
    protected categoryRepositoryGetter: Getter<CategoryRepository>,
  ) {
    super(Interest, dataSource);
    this.category = this.createBelongsToAccessorFor(
      'category',
      categoryRepositoryGetter,
    );
    this.registerInclusionResolver('category', this.category.inclusionResolver);
    this.product = this.createBelongsToAccessorFor(
      'product',
      productRepositoryGetter,
    );
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
