import {DefaultCrudRepository} from '@loopback/repository';
import {Interest, InterestRelations} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class InterestRepository extends DefaultCrudRepository<
  Interest,
  typeof Interest.prototype.id,
  InterestRelations
> {
  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource,
  ) {
    super(Interest, dataSource);
  }
}
