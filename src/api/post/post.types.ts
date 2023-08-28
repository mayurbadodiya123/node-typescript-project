export class Post {
  
  iPostId!:string;
  iPostTitle!:string;
  iUserId!:string;


  constructor(data?: Partial<Post>) {
    data && Object.assign(this, data);
  }
}
