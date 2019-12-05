import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Scenario, ScenarioRelations, Product, Interest} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';
import {InterestRepository} from './interest.repository';

export class ScenarioRepository extends DefaultCrudRepository<
  Scenario,
  typeof Scenario.prototype.id,
  ScenarioRelations
> {

  public readonly product: BelongsToAccessor<Product, typeof Scenario.prototype.id>;

  public readonly interest: BelongsToAccessor<Interest, typeof Scenario.prototype.id>;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource, @repository.getter('ProductRepository') protected productRepositoryGetter: Getter<ProductRepository>, @repository.getter('InterestRepository') protected interestRepositoryGetter: Getter<InterestRepository>,
  ) {
    super(Scenario, dataSource);
    this.interest = this.createBelongsToAccessorFor('interest', interestRepositoryGetter,);
    this.registerInclusionResolver('interest', this.interest.inclusionResolver);
    this.product = this.createBelongsToAccessorFor('product', productRepositoryGetter,);
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
