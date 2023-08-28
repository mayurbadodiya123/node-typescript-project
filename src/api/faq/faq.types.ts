export class Faq {
  iFaqId!: number;
  vFaqTitle!: string;
  tDescription!: string;

  constructor(data?: Partial<Faq>) {
    data && Object.assign(this, data);
  }
}
