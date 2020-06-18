import {DefaultCrudRepository} from '@loopback/repository';
import {QuestionOrder, QuestionOrderRelations} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class QuestionOrderRepository extends DefaultCrudRepository<
  QuestionOrder,
  typeof QuestionOrder.prototype.id,
  QuestionOrderRelations
> {
  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource,
  ) {
    super(QuestionOrder, dataSource);
  }
}
