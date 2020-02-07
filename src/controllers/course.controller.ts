import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
import {Course} from '../models';
import {CourseRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

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
            schema: {type: 'array', items: getModelSchemaRef(Course)},
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
        product: true,
        name: true,
        title: true,
        description: true,
        text: true,
        level: true,
        skill: true,
        location: true,
        date_start: true,
        date_finish: true,
        duration: true,
        frequency: true,
        address: true,
        link: true,
        enrolment_period_start: true,
        enrolment_period_finish: true,
        contact_person: true,
        contact_telephone: true,
        contact_email: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        product: productid,
        enrolment_period_finish: {
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
        ],
      });
    return filter.build();
  }
}
