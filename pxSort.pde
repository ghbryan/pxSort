PImage img;

boolean finished = false;

String filename = "whitespace";
String fileExt = "jpg";

void setup() {
    img = loadImage(filename + "." + fileExt);
    size(img.width, img.height);
    image(img, 0, 0); 
}

void draw() {
    while(!finished) {
        
        sortAllRows();
        saveFrame(filename + "_y.png");
        
        sortAllColumns();
        saveFrame(filename + "_yx.png");
        
        img = loadImage(filename + "." + fileExt);
     
        sortAllColumns();
        saveFrame(filename + "_x.png");
       
        sortAllRows();
        saveFrame(filename + "_xy.png");
        
        finished = true;
    }
    
    println("Sorting Complete.");
    System.exit(0); 
}

void sortAllRows() {
    for(int y = 0; y < img.height; y++) {
        img.loadPixels();
        sortRow(y);
        img.updatePixels();
        image(img, 0, 0);
    }
}

void sortAllColumns() {
    for(int x = 0; x < img.width; x++) {
        img.loadPixels();
        sortColumn(x);
        img.updatePixels();
        image(img, 0, 0);
    } 
}

void sortRow(int y) {
    color[] unsorted = new color[img.width];
    color[] sorted = new color[img.width];
    
    for(int x = 0; x < img.width; x++) {
        unsorted[x] = img.pixels[x + y * img.width]; 
    }
    
    sorted = sort(unsorted);
    
    for(int x = 0; x < img.width; x++) {
        img.pixels[x + y * img.width] = sorted[x]; 
    }
}

void sortColumn(int x) {
    color[] unsorted = new color[img.height];
    color[] sorted = new color[img.height];
    
    for(int y = 0; y < img.height; y++) {
        unsorted[y] = img.pixels[x + y * img.width]; 
    }
    
    sorted = sort(unsorted);
    
    for(int y = 0; y < img.height; y++) {
        img.pixels[x + y * img.width] = sorted[y]; 
    }
}
