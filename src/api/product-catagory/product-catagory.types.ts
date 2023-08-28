export class Catagory {
  iProductCatagoryId?: number;
  vProductCatagoryName!: string;
  dtUpdatedAt!: Date;
  dtCreatedAt!: Date;

  constructor(data?: Partial<Catagory>) {
    data && Object.assign(this, data);
  }
}
