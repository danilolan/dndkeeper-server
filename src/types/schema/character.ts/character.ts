export type Health = {
  total: number;
  actual: number;
  temporary: number;
};

export type Attributes = {
  strength: number;
  dexterity: number;
  constitution: number;
  intelligence: number;
  wisdom: number;
  charisma: number;
};

export type SavingThrows = {
  strength: number;
  dexterity: number;
  constitution: number;
  intelligence: number;
  wisdom: number;
  charisma: number;
};

export enum AttributesEnum {
  'str',
  'dex',
  'int',
  'wis',
  'cha',
}

export type Skill = {
  value: number;
  attribute: AttributesEnum;
};

export type Skills = {
  acrobatics: Skill;
  animalHanding: Skill;
  arcana: Skill;
  ahtletics: Skill;
  deception: Skill;
  history: Skill;
  insight: Skill;
  intimidation: Skill;
  investigation: Skill;
  medicine: Skill;
  nature: Skill;
  perception: Skill;
  performance: Skill;
  persuasion: Skill;
  religion: Skill;
  sleightOfHand: Skill;
  stealth: Skill;
  survival: Skill;
};

export type spells = {
  title: string;
  ready: boolean;
};
