
int[] list = new int[20];

// Setup the Processing Canvas
void setup() {
  size(600, 400);
  strokeWeight(2);
  noLoop();

  for (int i = 0; i < list.length; i++) {
    list[i] = i + 1;
  }

  reset();
}

// Main draw loop
void draw() {
  // Fill canvas grey
  background(new color("white"));

  drawBars();
}

int getMax(int[] list) {
  // Find maximum integer
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (max < list[i]) {
      max = list[i];
    }
  }
  return max;
}

void drawBars() {
  double h = height * 0.88;
  double w = width - 60;
  double unitWidth = w * 1.0 / list.length;
  int max = getMax(list);

  for (int i = 0; i < list.length; i++) {
    fill(#C0C0C0); // Color dim gray
    rect(i * unitWidth + 30, height
      - ((list[i] + 1) / max) * h, unitWidth, ((list[i] + 1) / max) * h - 20);
    fill(0, 102, 153);
    text(list[i], i * unitWidth + 30 + 10,
      height - ((list[i] + 1) / max) * h - 7);
    text(i, i * unitWidth + 30 + 10, height - 5);
  }

  text("index", 1, height - 5);
  drawSingleBar();
}

void drawSingleBar() {
  double h = height * 0.88;
  double w = width - 60;
  double unitWidth = w * 1.0 / list.length;
  int max = getMax(list);

  fill(#FF0000); // Color red
  if (i >= 0) {
    rect(i * unitWidth + 30, height
      - (list[i] + 1) / max * h, unitWidth, ((list[i] + 1) / max) * h - 20);
  }
}

int i = 0;

void reset() {
  i = 0;

  // Fill canvas grey
  background(new color("white"));

  shuffleList();
}

void shuffleList() {
  for (int i = 0; i < list.length; i++) {
    int index = int(random(list.length));
    int temp = list[index];
    list[index] = list[i];
    list[i] = temp;
  }
}

boolean step() {
    if (i > list.length - 1) return true;

    /** insert list[i] into a sorted sublist list[0..i-1] so that
    list[0..i] is sorted. */
    int currentElement = list[i];
    int k;
    for (k = i - 1; k >= 0 && list[k] > currentElement; k--) {
      list[k + 1] = list[k];
    }

    // Insert the current element into list[k + 1]
    list[k + 1] = currentElement;

    i++; // Increase step

  draw();

  return false; // Not sorted yet
}
