/* eslint-disable @typescript-eslint/camelcase */
import { Filter, repository, FilterBuilder } from '@loopback/repository';
import { param, get, getModelSchemaRef } from '@loopback/rest';
import { Course, CourseRelations } from '../models';
import { CourseRepository, ProductRepository } from '../repositories';
import { CommonController } from './common.controller';

export class CourseController {
  private commonController: CommonController;
  constructor(
    @repository(CourseRepository)
    public courseRepository: CourseRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  @get('/{productname}/courses', {
    responses: {
      '200': {
        description: 'Array of Course model instances',
        content: {
          'application/json': {
            schema: { type: 'array', items: getModelSchemaRef(Course) },
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
    @param.query.number('literacyLvl') literacyLvl: number,
    @param.query.number('numeracyLvl') numeracyLvl: number,
    @param.query.number('digitalSkillsLvl') digitalSkillsLvl: number,
    @param.query.string('location') location: string,
  ): Promise<Course[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(
      productid,
      literacyLvl,
      numeracyLvl,
      digitalSkillsLvl,
      location,
    );
    return this.courseRepository.find(filter);
  }

  @get('/{productname}/courses/{id}', {
    responses: {
      '200': {
        description: 'Course model instance',
        content: { 'application/json': { schema: getModelSchemaRef(Course) } },
      },
    },
  })
  async findById(
    @param.path.string('productname') productname: string,
    @param.path.number('id') id: number,
  ): Promise<(Course & CourseRelations) | null> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilterId(productid, id);
    return this.courseRepository.findOne(filter);
  }

  createFilterId(productid: number, courseid: number): Filter<Course> {
    const filter = new FilterBuilder<Course>();
    filter
      .fields({
        id: true,
        external_id: true,
        product: true,
        title: true,
        description: true,
        level: true,
        skill: true,
        location: true,
        address: true,
        link: true,
        enrolment_start: true,
        enrolment_finish: true,
        contact_person: true,
        contact_attention: true,
        contact_telephone: true,
        contact_email: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        id: courseid,
        product: productid,
      });
    return filter.build();
  }

  createFilter(
    productid: number,
    literacyLvl: number,
    numeracyLvl: number,
    digitalSkillsLvl: number,
    location: string,
  ): Filter<Course> {
    const filter = new FilterBuilder<Course>();
    filter
      .fields({
        id: true,
        external_id: true,
        product: true,
        title: true,
        description: true,
        level: true,
        skill: true,
        location: true,
        address: true,
        link: true,
        enrolment_start: true,
        enrolment_finish: true,
        contact_person: true,
        contact_attention: true,
        contact_telephone: true,
        contact_email: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        product: productid,
        enrolment_finish: {
          gte: new Date().toString(),
        },
        location,
        and: [
          {
            or: [
              {
                and: [
                  {
                    skill: 'literacy',
                  },
                  {
                    level: literacyLvl || 0,
                  },
                ],
              },
              {
                and: [
                  {
                    skill: 'numeracy',
                  },
                  {
                    level: numeracyLvl || 0,
                  },
                ],
              },
              {
                and: [
                  {
                    skill: 'digital_skills',
                  },
                  {
                    level: digitalSkillsLvl || 0,
                  },
                ],
              },
            ],
          },
          {
            or: [
              {
                enrolment_finish: {
                  lte: new Date(0).toString()
                }
              },
              {
                enrolment_finish: {
                  gte: new Date().toString(),
                }
              }
            ]
          }
        ],
      });
    return filter.build();
  }
}
