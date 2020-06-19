import { Entity, model, property, belongsTo } from '@loopback/repository';
import { Product } from './product.model';

@model()
export class Course extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  external_id?: number;

  @property({
    type: 'string',
  })
  title?: string;

  @property({
    type: 'string',
  })
  description?: string;

  @property({
    type: 'number',
  })
  level?: number;

  @property({
    type: 'string',
  })
  skill?: string;

  @property({
    type: 'string',
  })
  location?: string;

  @property({
    type: 'string',
  })
  address?: string;

  @property({
    type: 'string',
  })
  link?: string;

  @property({
    type: 'date',
  })
  enrolment_start?: string;

  @property({
    type: 'date',
  })
  enrolment_finish?: string;

  @property({
    type: 'string',
  })
  contact_person?: string;

  @property({
    type: 'string',
  })
  contact_telephone?: string;

  @property({
    type: 'string',
  })
  contact_email?: string;

  @property({
    type: 'string',
  })
  contact_attention?: string;

  @belongsTo(() => Product)
  product: number;

  constructor(data?: Partial<Course>) {
    super(data);
  }
}

export interface CourseRelations {
  // describe navigational properties here
}

export type CourseWithRelations = Course & CourseRelations;
