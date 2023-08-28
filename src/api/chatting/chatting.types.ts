export class Chatting {
  iChannelId!: number;
  vChannelTitle!: string;
  tDescription!: string;

  constructor(data?: Partial<Chatting>) {
    data && Object.assign(this, data);
  }
}
