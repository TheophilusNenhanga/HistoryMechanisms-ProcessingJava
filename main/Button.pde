public class Button {
	private String action;
	private int width;
	private int height;
	private int x;
	private int y;
	private ArrayList<Button> children;
	private boolean visible;
	private boolean pressed;
	private int[] fill;
	private boolean childrenVisible;
	private int clickCount;
	private boolean hovered;
	private int minimumHeight;
	private int maximumHeight;

	public Button(String action, int x, int y) {
		this.action = action;
		this.width = 140;
		this.height = 30;
		this.x = x;
		this.y = y;
		this.children = new ArrayList<Button>();
		this.visible = false;
		this.childrenVisible = false;
		this.fill = new int[]{200, 200, 200};
		this.pressed = false;
		this.clickCount = 0;
		this.hovered = false;
		this.minimumHeight = 20;
		this.maximumHeight = 160;
	}

	public void draw() {
		if (this.visible) {
			fill(this.fill[0], this.fill[1], this.fill[2]);
			rect(this.x, this.y, this.width, this.height);
			textSize(18);
			fill(0, 0, 0);
			text(this.action, this.x, this.y + 5, this.width, 20);

			this.children.forEach(child -> child.draw());
		}
	}

	public ArrayList<Button> getChildren() {
		return this.children;
	}

	public void addChild(Button child) {
		this.children.add(child);
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public boolean isVisible() {
		return this.visible;
	}

	public void showChildren() {
		this.children.forEach((child) -> {
			child.setVisible(true);
		});
	}

	public void hideChildren() {
		this.children.forEach((child) -> {
			child.setVisible(false);
		});
	}

	public boolean contains(int x, int y) {
		if (x >= this.x && y >= this.y && x <= this.x + this.width && y <= this.y + this.height) {
			return true;
		}
		return false;
	}

	public void onClickEnter() {
		if (!this.childrenVisible) {
			showChildren();
			childrenVisible = true;
		} else {
			hideChildren();
			childrenVisible = false;
		}
		this.clickCount += 1;
	}

	public void onPressEnter() {
		this.pressed = true;
		showChildren();
		childrenVisible = true;
	}

	public void onPressExit() {
		this.pressed = false;
		hideChildren();
		childrenVisible = false;
	}

	public void onClickExit() {
		if (!this.pressed) {
			hideChildren();
			childrenVisible = false;
		}
		this.pressed = false;
	}

	public void onHoverEnter() {
		if (this.visible) {
			this.hovered = true;
			this.fill[0] = 255;
			this.fill[1] = 255;
			this.fill[2] = 255;
		}
	}

	public void onHoverExit() {
		if (this.visible && this.hovered) {
			this.fill[0] = 200;
			this.fill[1] = 200;
			this.fill[2] = 200;
			this.hovered = false;
		}
	}

	public int getClickCount() {
		return this.clickCount;
	}

	public String getAction() {
		return this.action;
	}

	@Override
	public String toString() {
		return "\n" + this.action + " clicked: " + this.clickCount + " visible: " + this.visible;
	}

	public void setX(int newX) {
		this.x = newX;
	}

	public int getX() {
		return this.x;
	}

	public void setY(int newY) {
		this.y = newY;
	}

	public int getY() {
		return this.y;
	}

	public int getWidth() {
		return this.width;
	}

	public int getHeight() {
		return this.height;
	}

	public void changeFill(int v1, int v2, int v3) {
		this.fill[0] = v1;
		this.fill[1] = v2;
		this.fill[2] = v3;
	}

	public int[] getFill() {
		return this.fill;
	}

	public void grow() {
		this.height = Math.min(this.maximumHeight, this.height + 5);
	}

	public void shrink() {
		this.height = Math.max(this.minimumHeight, this.height - 5);
	}

	public void resetSize() {
		this.width = 140;
		this.height = 30;
	}
}
