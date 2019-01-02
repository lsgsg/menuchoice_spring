package pack.food.model.seul;

public class SurveyClass {
	int foodTuple = 223;
	public double choiceAct(String active, String choiceBmi) {
		
		if(choiceBmi.equals("경증비만") || choiceBmi.equals("중증도비만")  ||
				choiceBmi.equals("고도비만") ||choiceBmi.equals("과체중") || choiceBmi.equals("위험체중") ) {
			choiceBmi = "비만";
		}
		
		//System.out.println("bmi결과 : " + choiceBmi);

		double act = 0;
		 if(active.equals("하")){
				if(choiceBmi.equals("저체중")){
					act = 35;
				}else if(choiceBmi.equals("정상체중")){
					act = 30;
				}else if(choiceBmi.equals("비만")){
					act = 22.5;
				}
			}

			 if(active.equals("중")){
				if(choiceBmi.equals("저체중")){
					act = 40;
				}else if(choiceBmi.equals("정상체중")){
					act = 35;
				}else if(choiceBmi.equals("비만")){
					act = 30;
				}
			}

			 if(active.equals("상")){
				if(choiceBmi.equals("저체중")){
					act = 45;
				}else if(choiceBmi.equals("정상체중")){
					act = 40;
				}else if(choiceBmi.equals("비만")){
					act = 35;
				}
			}
		return act;
	}

	public String choiceBmi(double bmi) {
		String choiceBmi = null;
		if(bmi < 18.5) {
			choiceBmi = "저체중";
		}else if(bmi >= 18.5 & bmi <=22.9) {
			choiceBmi = "정상체중";
		}else if(bmi >= 23.0 & bmi <= 24.9) {
			choiceBmi = "위험체중";
		}else if(bmi >= 25.0 & bmi <= 29.9) {
			choiceBmi = "경증비만";
		}else if(bmi >= 30.0 & bmi <= 34.9) {
			choiceBmi = "중증도비만";
		}else if(bmi >= 35.0) {
			choiceBmi = "고도비만";
		}
		
		return choiceBmi;
	}

	public double needKcal(double standardKg, double choiceAct) {
		double kcal = standardKg * choiceAct;
		return kcal;
	}

	public double needProtein(double standardKg) {
		double protein = standardKg * 0.825;
		return protein;
	}
	
	public double purposeTan(double needKcal) {
		double purposeTan = ((needKcal * 0.6) / 4 );
		return purposeTan;
	}
	
	public double purposeJi(double needKcal) {
		double purposeJi = ((needKcal * 0.2) / 9 );
		return purposeJi;
	}
	
	public double saveBmi(String weight, String height) {
		// bmi 계산
		double weight2 = Double.parseDouble(weight);
		double height2 = Double.parseDouble(height) * 0.01;

		double bmi = weight2 / (height2 * height2);
		return bmi;
	}

	public double saveBmr(String weight, String height, String age, String gen) {
		// 기초대사량 구하기 
		double weight2 = Double.parseDouble(weight);
		double height2 = Double.parseDouble(height);
		double age2 = Double.parseDouble(age); 
		
		double bmr = 0 ;
		
		if(gen.equals("여")) {
			 
			bmr = 10 * weight2 + 6.25 * height2 - 5 * age2 + 5;
			
		}else if(gen.equals("남")) {
			bmr = 10 * weight2 + 6.25 * height2 - 5 * age2  - 161;
		}
		
		
		
		return bmr;
	}

	public double standardWeight(String height, String gen) {
		// 표준체중 구하기
		double height2 = Double.parseDouble(height)*0.01;
		double standardKg = 0;
		
		if(gen.equals("여")) {
			 
			standardKg= height2 * height2 * 21;
			
		}else if(gen.equals("남")) {
			
			standardKg= height2 * height2 * 22;
		}
		
		
		return standardKg;
	}
	
	
	
	public double recommendKcal(double bmr, double kcal, String choiceBmi) {
		
		double recommendKcal = 0;
		
		if(choiceBmi.equals("저체중")) {
			recommendKcal = (kcal * 1.1);
		}else if(choiceBmi.equals("정상체중")) {
			recommendKcal = kcal;
		}else if(choiceBmi.equals("과체중")) {
			recommendKcal = kcal * 0.9;
		}else if(choiceBmi.equals("위험체중")) {
			recommendKcal = kcal * 0.8;
		}else if(choiceBmi.equals("경증비만")) {
			recommendKcal = kcal * 0.7;
		}else if(choiceBmi.equals("중증도비만")) {
			recommendKcal = bmr;
		}else if(choiceBmi.equals("고도비만")) {
			recommendKcal = bmr;
		}
		
		
		
		return recommendKcal;
	}
	
	public double needTan(double recommendKcal) {
		double needTan = ((recommendKcal * 0.6) / 4 );
		return needTan;
	}
	
	public double needJi(double recommendKcal) {
		double needJi = ((recommendKcal * 0.2) / 9 );
		return needJi;
	}
	

	

	

	
}
