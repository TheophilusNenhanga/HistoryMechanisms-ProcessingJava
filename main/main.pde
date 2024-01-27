Model model = new Model();
Button fileButton = model.getFileButton();
int[][] fillColorsRecency = new int[][]{{60, 60, 255}, {110, 110, 220}, {120, 120, 190}, {130, 130, 170}, {140, 140, 140}};  // Colors that will be used for the different modes
int[][] fillColorsFrequency = new int[][]{{60, 260, 60}, {100, 230, 100}, {120, 200, 120}, {130, 170, 130}, {140, 140, 140}};
boolean anyClicked = false;

enum Mode {RECENCY_HOTLIST, RECENCY_HIGHLIGHTING, FREQUENCY_HIGHLIGHTING, FREQUENCY_RESIZING, NO_MODE}

Mode mode = Mode.NO_MODE;

boolean childrenShown = false;

void setup() {
	size(1000, 1000);
	frameRate(30);
	windowTitle("Theophilus Nenhanga - CMPT 481 - Assignment 2");
	textAlign(CENTER, CENTER);
}

void draw() {
	background(51); // color the background grey each draw loop
	fileButton.setVisible(true);

	// do something different for each mode
	switch (mode) {
		case RECENCY_HOTLIST: {
			model.clearProxies();
			for (int i = 0; i < model.getRecentButtons().size(); i++) {
				ProxyButton proxy = new ProxyButton(model.getRecentButtons().get(i), fileButton.getX(), fileButton.getY() + (i + 1) * fileButton.getHeight()); // TODO check positions of buttons. Why are they not appearing?
				model.addProxy(proxy);
			}
			break;
		}

		case RECENCY_HIGHLIGHTING: {
			resetButtons();
			for (int i = 0; i < 3; i++) {
				if (model.getRecentButtons().size() > i+1) {
					model.getRecentButtons().get(i).changeFill(fillColorsRecency[i]);
				}
			}
			break;
		}

		case FREQUENCY_HIGHLIGHTING: {
			resetButtons();
			for (int i = 0; i < 3; i++) {
				if (model.getFrequentButtons().size() > i+1) {
					model.getFrequentButtons().get(i).changeFill(fillColorsFrequency[i]);
				}
			}
			break;
		}

		case FREQUENCY_RESIZING: {

			Button first = model.getFrequentButtons().get(0);
			Button second = model.getFrequentButtons().get(1);
			Button third = model.getFrequentButtons().get(2);

			Button last = model.getFrequentButtons().get(model.getFrequentButtons().size() - 1);
			Button last1 = model.getFrequentButtons().get(model.getFrequentButtons().size() - 2);
			Button last2 = model.getFrequentButtons().get(model.getFrequentButtons().size() - 3);

			if (first.getClickCount() != 0) {
				first.grow(3);
			}

			if (second.getClickCount() != 0) {
				second.grow(2);
			}

			if (third.getClickCount() != 0) {
				third.grow(1);
			}

			for (Button button : model.getButtons()) {
				if (!(button == first || button == second || button == third || button == last || button == last1 || button == last2)) {
					button.resetSize();
				}
			}

			if (anyClicked) {
				last.shrink(3);
				last1.shrink(2);
				last2.shrink(1);
			}

			for (int i = 0; i < model.getButtons().size(); i++) {
				if (model.getButtons().get(i) == fileButton) {
					continue;
				}
				if (i == 0) {
					continue;
				}
				Button thisButton = model.getButtons().get(i);
				Button prevButton = model.getButtons().get(i - 1);
				thisButton.setY(prevButton.getY() + prevButton.getHeight());
			}

			break;
		}

		case NO_MODE: {
			break;
		}

	} //<>// //<>//

	fileButton.draw();
	model.getProxies().forEach(b -> b.draw()); //<>// //<>//
}

void mouseClicked() {
	model.getProxies().forEach((button) -> {
		button.onPressExit();
		if (button.contains(mouseX, mouseY)) {
			anyClicked = true;
			button.onClickEnter();
			model.addRecentButton(button.getButton());
		} else {
			button.onClickExit();
		}
	});

	model.getButtons().forEach((button) -> {
		button.onPressExit();
		if (button.contains(mouseX, mouseY)) {
			button.onClickEnter();
			model.addRecentButton(button);
		} else {
			button.onClickExit();
		}
	});
}

void mousePressed() {
	model.getProxies().forEach((button) -> {
		if (button.contains(mouseX, mouseY)) {
			button.onPressEnter();
		}
	});

	model.getButtons().forEach((button) -> {
		if (button.contains(mouseX, mouseY)) {
			button.onPressEnter();
		}
	});
}


void mouseMoved() {
	model.getProxies().forEach((b) -> {
		if (b.contains(mouseX, mouseY)) {  //<>//
			b.onHoverEnter();
		} else {
			b.onHoverExit();
		}
	});

	model.getButtons().forEach((button) -> {
		if (button.contains(mouseX, mouseY)) {
			button.onHoverEnter();
		} else {
			button.onHoverExit();
		}
	});
}

void keyTyped() {
	switch (key) {
		case 'q': {
      println("Current Mode: " + mode + "\n");
      println("Button Frequency list: ");
			println(model.getFrequentButtons() + "\n");
      println("Button Recency list: ");
			println(model.getRecentButtons() + "\n");
      println("Proxy Buttons: ");
			println(model.getProxies() + "\n");
			break;
		}

		case '1': {
			if (mode == Mode.RECENCY_HIGHLIGHTING || mode == Mode.FREQUENCY_HIGHLIGHTING) {
				model.getButtons().forEach(button -> {
					button.changeFill(200, 200, 200);
				});
			}
			if (mode == Mode.FREQUENCY_RESIZING) {
				resetButtons();
				model.getButtons().forEach(button -> {
					button.resetSize();
					button.setTextSize(18);
				});
			}

			for (int i = 0; i < model.getButtons().size(); i++) {
				if (model.getButtons().get(i) == fileButton) {
					continue;
				}
				if (i == 0) {
					continue;
				}
				Button thisButton = model.getButtons().get(i);
				Button prevButton = model.getButtons().get(i - 1);
				thisButton.setY(prevButton.getY() + prevButton.getHeight());
			}
			if (mode != Mode.RECENCY_HOTLIST) {
				mode = Mode.RECENCY_HOTLIST;
				model.getButtons().forEach(button -> {
					if (button != fileButton) {
						button.setY(button.getY() + 100);
					}
				});
			}
			break;
		}

		case '2': {
			if (mode == Mode.RECENCY_HIGHLIGHTING) {
				model.getButtons().forEach(button -> {
					button.changeFill(200, 200, 200);
				});
			}

			if (mode == Mode.RECENCY_HOTLIST) {
				model.clearProxies();
				model.getButtons().forEach(button -> {
					if (button != fileButton) {
						button.setY(button.getY() - 100);
					}
				});
			}

			if (mode == Mode.FREQUENCY_RESIZING) {
				model.getButtons().forEach(button -> {
					button.resetSize();
					button.setTextSize(18);
					resetButtons();
				});
			}

			if (mode != Mode.RECENCY_HIGHLIGHTING) {
				mode = Mode.RECENCY_HIGHLIGHTING;
			}
			break;
		}

		case '3': {
			if (mode == Mode.RECENCY_HIGHLIGHTING) {
				model.getButtons().forEach(button -> {
					button.changeFill(200, 200, 200);
				});
			}

			if (mode == Mode.RECENCY_HOTLIST) {
				model.clearProxies();
				model.getButtons().forEach(button -> {
					if (button != fileButton) {
						button.setY(button.getY() - 100);
					}
				});
			}

			if (mode == Mode.FREQUENCY_RESIZING) {
				resetButtons();
				model.getButtons().forEach(button -> {
					button.resetSize();
					button.setTextSize(18);
				});
			}

			if (mode != Mode.FREQUENCY_HIGHLIGHTING) {
				mode = Mode.FREQUENCY_HIGHLIGHTING;
			}
			break;
		}

		case '4': {
			if (mode == Mode.RECENCY_HIGHLIGHTING || mode == Mode.FREQUENCY_HIGHLIGHTING) {
				model.getButtons().forEach(button -> {
					button.changeFill(200, 200, 200);
				});
			}

			if (mode == Mode.RECENCY_HOTLIST) {
				model.clearProxies();
				model.getButtons().forEach(button -> {
					if (button != fileButton) {
						button.setY(button.getY() - 100);
					}
				});
			}

			if (mode != Mode.FREQUENCY_RESIZING) {
				mode = Mode.FREQUENCY_RESIZING;
			}
			break;
		}
	}


}

void resetButtons() {
	for (int i = 0; i < model.getButtons().size(); i++) {
		if (model.getButtons().get(i) == fileButton) {
			continue;
		}
		if (i == 0) {
			continue;
		}
		Button thisButton = model.getButtons().get(i);
		Button prevButton = model.getButtons().get(i - 1);
		thisButton.setY(prevButton.getY() + prevButton.getHeight());
	}
}
