import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Product} from './product.model';
import {Interest} from './interest.model';
import {Category} from './category.model';

@model()
export class Scenario extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  text: string;

  @property({
    type: 'number',
    required: true,
  })
  level: number;

  @property({
    type: 'string',
  })
  resource?: string;

  @property({
    type: 'string',
  })
  description?: string;

  @belongsTo(() => Product)
  product: number;

  @belongsTo(() => Interest)
  interest: number;

  @belongsTo(() => Category)
  category: number;

  constructor(data?: Partial<Scenario>) {
    super(data);
  }
}

export interface ScenarioRelations {
  // describe navigational properties here
}

export type ScenarioWithRelations = Scenario & ScenarioRelations;
