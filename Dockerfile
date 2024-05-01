##베이스 이미지 선택 16버전 작은단위
FROM node:16-alpine 

#root/app 안에 프로젝트와 관련된 파일(어플리케이션)을 가져오겠다
WORKDIR /app

#빈번이 변경되는 걸 젤 나중에 적는다!
#현재 경로인 /app으로 복사
COPY package.json package-lock.json ./

#package.json에 명시되있는 모든 라이브러리를 설치
#RUN npm install

#package-lock.json에 명시된 걸 설치 (정해진 버전 설치를 위해)
RUN npm ci

#소스파일 카피
COPY index.js .

#노드를 실행하고 index.js를 실행해
ENTRYPOINT [ "node", "index.js" ]