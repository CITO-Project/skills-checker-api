import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Scenario, ScenarioRelations, Product, Interest, Category} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';
import {InterestRepository} from './interest.repository';
import {CategoryRepository} from './category.repository';

export class ScenarioRepository extends DefaultCrudRepository<
  Scenario,
  typeof Scenario.prototype.id,
  ScenarioRelations
> {

  public readonly product: BelongsToAccessor<Product, typeof Scenario.prototype.id>;

  public readonly interest: BelongsToAccessor<Interest, typeof Scenario.prototype.id>;

  public readonly category: BelongsToAccessor<Category, typeof Scenario.prototype.id>;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource, @repository.getter('ProductRepository') protected productRepositoryGetter: Getter<ProductRepository>, @repository.getter('InterestRepository') protected interestRepositoryGetter: Getter<InterestRepository>, @repository.getter('CategoryRepository') protected categoryRepositoryGetter: Getter<CategoryRepository>,
  ) {
    super(Scenario, dataSource);
    this.category = this.createBelongsToAccessorFor('category', categoryRepositoryGetter,);
    this.registerInclusionResolver('category', this.category.inclusionResolver);
    this.interest = this.createBelongsToAccessorFor('interest', interestRepositoryGetter,);
    this.registerInclusionResolver('interest', this.interest.inclusionResolver);
    this.product = this.createBelongsToAccessorFor('product', productRepositoryGetter,);
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
