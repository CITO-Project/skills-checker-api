import {DefaultCrudRepository} from '@loopback/repository';
import {Scenario, ScenarioRelations} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ScenarioRepository extends DefaultCrudRepository<
  Scenario,
  typeof Scenario.prototype.id,
  ScenarioRelations
> {
  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource,
  ) {
    super(Scenario, dataSource);
  }
}
