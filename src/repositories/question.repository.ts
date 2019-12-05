import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Question, QuestionRelations, Product, Scenario} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';
import {ScenarioRepository} from './scenario.repository';

export class QuestionRepository extends DefaultCrudRepository<
  Question,
  typeof Question.prototype.id,
  QuestionRelations
> {

  public readonly product: BelongsToAccessor<Product, typeof Question.prototype.id>;

  public readonly scenario: BelongsToAccessor<Scenario, typeof Question.prototype.id>;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource, @repository.getter('ProductRepository') protected productRepositoryGetter: Getter<ProductRepository>, @repository.getter('ScenarioRepository') protected scenarioRepositoryGetter: Getter<ScenarioRepository>,
  ) {
    super(Question, dataSource);
    this.scenario = this.createBelongsToAccessorFor('scenario', scenarioRepositoryGetter,);
    this.registerInclusionResolver('scenario', this.scenario.inclusionResolver);
    this.product = this.createBelongsToAccessorFor('product', productRepositoryGetter,);
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
