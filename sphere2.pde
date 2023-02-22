class Planet
{  
  void draw(int vel, int pos, int size, String image)
  {
    //lights();
    pushMatrix();//元の座標を保存する

    translate(width/2, height/2);//座標の移動(回転の軸)
    rotateY(frameCount*PI/vel);//回転の速さ   
    translate(pos, 0);//座標の移動(球の位置)

    noStroke();
    fill(255, 255, 255);//色の指定(白)

    //球に貼り付ける画像の設定
    PImage img = loadImage(image);
    PShape sphere = createShape(SPHERE, size);//半径sizeの球
    sphere.setTexture(img);
    sphere.setStrokeWeight(0);

    shape(sphere);//球を描画

    popMatrix();//保存した座標に戻る
  }
}

class Earth
{
  void satellite()
  {
    rotateY(frameCount*PI/50);//回転の速さ
    rotateY(frameCount*PI/50);//回転の速さ

    translate(30, 0);//座標の移動(球の位置)
    fill(255, 255, 255);//色の指定(白)

    //球に貼り付ける画像の設定
    PImage img2 = loadImage("tuki.jpg");
    PShape sphere2 = createShape(SPHERE, 6);//半径6の球
    sphere2.setTexture(img2);
    sphere2.setStrokeWeight(0);

    shape(sphere2);//球を描画
  }

  void draw()
  {
    lights();
    pushMatrix();//元の座標を保存する

    translate(width/2, height/2);//座標の移動(回転の軸)
    rotateY(frameCount*PI/140);//回転の速さ

    translate(200, 0);//座標の移動(球の位置)
    noStroke();
    fill(255, 255, 255);//色の指定(白)

    //球に貼り付ける画像の設定
    PImage img = loadImage("earth.jpg");
    PShape sphere = createShape(SPHERE, 16);//半径16の球
    sphere.setTexture(img);
    sphere.setStrokeWeight(0);

    shape(sphere);//球を描画

    strokeWeight( 40 );
    satellite();

    popMatrix();//保存した座標に戻る
  }
}

class Saturn
{
  void ring()
  {
    noFill();
    strokeWeight(1);

    rotateX(PI/2);
    rotateZ(PI/10);

    int num_rings = 15;
    int ring_radious = 190;
    
    //複数の円を半径を短くしつつ描く
    for (int i=0; i<num_rings; ++i) {
      int r = ring_radious;
      
      //輪の色の設定
      if (i < 5) stroke(#8E857F);
      else if (5 <= i && i < 7) stroke(#524E4B);
      else stroke(#B4A69D);
      
      ellipse(0, 0, r, r);//半径rの縁を描く
      
      ring_radious = ring_radious - 4;
    }
  }
  void draw()
  {
    lights();
    pushMatrix();//元の座標を保存する
    
    translate(width/2, height/2);//座標の移動(回転の軸)
    rotateY(frameCount*PI/2300);//回転の速さ
    translate(700, 0);//座標の移動(球の位置)
    
    noStroke();
    fill(255, 255, 255);//色の指定(白)
    
    //球に貼り付ける画像の設定
    PImage img = loadImage("dosei.jpg");
    PShape sphere = createShape(SPHERE, 50);//半径50の球
    rotateZ(PI/10);
    //rotateY(PI/8);
    sphere.setTexture(img);
    sphere.setStrokeWeight(0);
    
    shape(sphere);//球を描画
    
    ring();
    
    popMatrix();//保存した座標に戻る
  }
}

class Sun
{
  void draw()
  {
    lights();
    pushMatrix();//元の座標を保存

    translate(width/2, height/2);//座標を移動する(原点を中央に移動)
    rotateY(frameCount*PI/80);

    noStroke();//輪郭なし
    fill(255, 255, 255);//色の指定(白)

    //球に貼り付ける画像の設定
    PImage img = loadImage("sun.jpg");
    PShape sphere = createShape(SPHERE, 75);//半径75の球
    sphere.setTexture(img);
    sphere.setStrokeWeight(0);

    shape(sphere);//球を描画

    popMatrix();//保存した座標に戻る
  }
}

Planet planet;
Sun sun;
Earth earth;
Saturn saturn;

void setup() {
  size(1400, 800, P3D);

  planet = new Planet();
  sun = new Sun();
  earth = new Earth();
  saturn = new Saturn();
}

void draw()
{  
  PImage img;

  img = loadImage("haikei.jpg"); //背景の画像

  //背景の設定
  img.resize(1400, 800 );
  background( img );
  
  sun.draw();//Sunクラスのdrawメソッド呼び出し
  
  earth.draw();//Earthクラスのdrawメソッド呼び出し
  
  saturn.draw();//Saturnクラスのdrawメソッド呼び出し

  //Planetクラスのdrawメソッド呼び出し
  planet.draw(32, 90, 4, "suisei.jpg");//水星
  planet.draw(70, 120, 16, "kinsei.jpg");//金星
  planet.draw(340, 200, 8, "mars.jpeg");//火星
  planet.draw(1100, 500, 60, "mokusei.jpg");//木星
  planet.draw(10000, 750, 15, "ten.jpg");//天王星
  planet.draw(32800, 800, 15, "kai.jpg");//海王星
  
}
