import {DefaultCrudRepository} from '@loopback/repository';
import {Skill, SkillRelations} from '../models';
import {PostgresqlDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class SkillRepository extends DefaultCrudRepository<
  Skill,
  typeof Skill.prototype.id,
  SkillRelations
> {
  constructor(
    @inject('datasources.postgresql') dataSource: PostgresqlDataSource,
  ) {
    super(Skill, dataSource);
  }
}
