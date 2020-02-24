import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Answer, AnswerRelations, Product, Question} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ProductRepository} from './product.repository';
import {QuestionRepository} from './question.repository';

export class AnswerRepository extends DefaultCrudRepository<
  Answer,
  typeof Answer.prototype.id,
  AnswerRelations
> {

  public readonly product: BelongsToAccessor<Product, typeof Answer.prototype.id>;

  public readonly question: BelongsToAccessor<Question, typeof Answer.prototype.id>;

  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource, @repository.getter('ProductRepository') protected productRepositoryGetter: Getter<ProductRepository>, @repository.getter('QuestionRepository') protected questionRepositoryGetter: Getter<QuestionRepository>,
  ) {
    super(Answer, dataSource);
    this.question = this.createBelongsToAccessorFor('question', questionRepositoryGetter,);
    this.registerInclusionResolver('question', this.question.inclusionResolver);
    this.product = this.createBelongsToAccessorFor('product', productRepositoryGetter,);
    this.registerInclusionResolver('product', this.product.inclusionResolver);
  }
}
