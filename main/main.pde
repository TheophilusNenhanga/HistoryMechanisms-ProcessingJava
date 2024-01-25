Model model = new Model();
Button fileButton = model.getFileButton();
int[][] fillColors = new int[][]{[], [], [], [], []}; // TODO: manually code in 5 colors

enum Mode {RECENCY_HOTLIST, RECENCY_HIGHLIGHTING, FREQUENCY_HIGHLIGHTING, FREQUENCY_RESIZING, NO_MODE}

Mode mode = Mode.NO_MODE;

boolean childrenShown = false;

void setup() {
	size(800, 800);
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
			for (int i = 0; i < model.getRecentButtons().size(); i++) {
				int[] currentFill = model.getRecentButtons().get(i).getFill();
				model.getRecentButtons().get(i).changeFill(currentFill[0] - (i + 1) * 25, currentFill[1] + (i + 1) * 10, currentFill[2] - (i + 1) * 15);
			}
			break;
		}

		case FREQUENCY_HIGHLIGHTING: {
			for (int i = 0; i < 3; i++) {
				int[] currentFill = model.getFrequentButtons().get(i).getFill();
				model.getFrequentButtons().get(i).changeFill(currentFill[0] - (i + 1) * 10, currentFill[1] - (i + 1) * 15, currentFill[2] + (i + 1) * 15);
			}
			break;
		}

		case FREQUENCY_RESIZING: {

			break;
		}

		case NO_MODE: {
			break;
		}

	}

	fileButton.draw();
	model.getProxies().forEach(b -> b.draw());
}

void mouseClicked() {
	model.getProxies().forEach((button) -> {
		button.onPressExit();
		if (button.contains(mouseX, mouseY)) {
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
 //<>//
void mouseMoved() {
	model.getProxies().forEach((b) -> {
		if (b.contains(mouseX, mouseY)) { //<>//
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
			println(model.getFrequentButtons());
			println(model.getRecentButtons());
			println(model.getProxies());
			break;
		}

		case '1': {
			if (mode == Mode.RECENCY_HIGHLIGHTING || mode == Mode.FREQUENCY_HIGHLIGHTING) {
				model.getButtons().forEach(button -> {
					button.changeFill(200, 200, 200);
				});
			}
			if (mode == Mode.FREQUENCY_RESIZING){
				model.getButtons().forEach(button -> button.resetSize());
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

			if (mode == Mode.FREQUENCY_RESIZING){
				model.getButtons().forEach(button -> button.resetSize());
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

			if (mode == Mode.FREQUENCY_RESIZING){
				model.getButtons().forEach(button -> button.resetSize());
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

			Button first = model.getFrequentButtons().get(0);
			Button second = model.getFrequentButtons().get(1);
			Button third = model.getFrequentButtons().get(2);
			for (int i = 0; i < model.getFrequentButtons().size(); i++) {
				if (model.getFrequentButtons().get(i) == first || model.getFrequentButtons().get(i) == second || model.getFrequentButtons().get(i) == third) {
					model.getFrequentButtons().get(i).grow();
				} else {
					model.getFrequentButtons().get(i).shrink();
				}
			}
			break;
		}
	}
}
