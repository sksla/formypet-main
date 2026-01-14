package com.formypet.board.model.vo;

public class Macro {
	
    private int macroNo;
	private String macroContent;
	
	public Macro() {}

	public Macro(int macroNo, String macroContent) {
		super();
		this.macroNo = macroNo;
		this.macroContent = macroContent;
	}

	public int getMacroNo() {
		return macroNo;
	}

	public void setMacroNo(int macroNo) {
		this.macroNo = macroNo;
	}

	public String getMacroContent() {
		return macroContent;
	}

	public void setMacroContent(String macroContent) {
		this.macroContent = macroContent;
	}

	@Override
	public String toString() {
		return "Macro [macroNo=" + macroNo + ", macroContent=" + macroContent + "]";
	}
	
	
	
}
