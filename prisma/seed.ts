import { BaseData, BaseDataType, PrismaClient } from '@prisma/client';
import axios from 'axios';

const url = 'https://www.dnd5eapi.co/api/';

const paths = [
  'races',
  'classes',
  'ability-scores',
  'skills',
  'spells',
  'backgrounds',
  'languages',
];

const prisma = new PrismaClient();
async function main() {
  for (let i = 0; i < paths.length; i++) {
    const results = await getData(paths[i]);
    results.forEach(async (result) => {
      await prisma.baseData.upsert({
        where: {
          index: result.index,
        },
        update: {},
        create: {
          index: result.index,
          name: result.name,
          url: result.url,
          baseDataType: getBaseDataType(paths[i]),
        },
      });
    });
  }
}
main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });

async function getData(path: string): Promise<BaseData[]> {
  const { data } = await axios.get(url + path);
  console.log(data.results);
  return data.results;
}

function getBaseDataType(path: string): BaseDataType {
  switch (path) {
    case 'races':
      return BaseDataType.RACE;
    case 'classes':
      return BaseDataType.CLASS;
    case 'ability-scores':
      return BaseDataType.ATTRIBUTE;
    case 'skills':
      return BaseDataType.SKILL;
    case 'spells':
      return BaseDataType.SPELL;
    case 'backgrounds':
      return BaseDataType.BACKGROUND;
    case 'languages':
      return BaseDataType.LANGUAGE;
  }
}
