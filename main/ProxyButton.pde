class ProxyButton {

	private int width;
	private int height;
	private int x;
	private int y;
	Button button;
	private int[] fill;

	public ProxyButton(Button button, int x, int y) {
		this.button = button;
		this.fill = new int[]{200, 200, 200};
		this.width = button.getWidth();
		this.height = button.getHeight();
		this.x = x;
		this.y = y;
	}

	public Button getButton() {
		return this.button;
	}

	public String getAction() {
		return this.button.getAction();
	}

	public void draw() {
		if (this.button.isVisible()) {
			fill(this.fill[0], this.fill[1], this.fill[2]);
			rect(this.x, this.y, this.width, this.height);
			textSize(18);
			fill(0, 0, 0);
			text(this.button.getAction(), this.x, this.y, this.width, this.height);

			fill(200, 200, 200);
			rect(fileButton.getX(), fileButton.getY() + 120, 140, 10);
			textSize(8);
			fill(0, 0, 0);
			text("end of recency list", fileButton.getX(), fileButton.getY() + 120, 140, 10);
		}
	}

	public boolean contains(int x, int y) {
		if (x >= this.x && y >= this.y && x <= this.x + this.width && y <= this.y + this.height) {
			return true;
		}
		return false;
	}

	public void onHoverEnter() {
		if (this.button.isVisible()) {
			this.fill[0] = 255;
			this.fill[1] = 255;
			this.fill[2] = 255;
		}
	}

	public void onHoverExit() {
		if (this.button.isVisible()) {
			this.fill[0] = 200;
			this.fill[1] = 200;
			this.fill[2] = 200;
		}
	}

	public void onClickEnter() {
		this.button.onClickEnter();
	}

	public void onPressEnter() {
		this.button.onPressEnter();
	}

	public void onPressExit() {
		this.button.onPressExit();
	}

	public void onClickExit() {
		this.button.onClickExit();
	}
}
