# ==============================
# Dockerfile لمشروع Node.js + Python
# ==============================

# 1️⃣ استخدم صورة رسمية لـ Node.js
FROM node:20

# 2️⃣ اضبط مجلد العمل داخل الحاوية
WORKDIR /app

# 3️⃣ نسخ package.json و package-lock.json للـ backend
COPY backend/package*.json ./backend/

# 4️⃣ تثبيت dependencies للـ Node.js
RUN cd backend && npm install

# 5️⃣ نسخ مجلد backend بالكامل (يشمل ml)
COPY backend ./backend

# 6️⃣ تثبيت Python و pip
RUN apt-get update && apt-get install -y python3 python3-pip

# 7️⃣ تثبيت مكتبات Python من requirements.txt
RUN pip3 install -r backend/ml/requirements.txt

# 8️⃣ تعيين البورت الذي سيستخدمه السيرفر
EXPOSE 5000

# 9️⃣ أمر تشغيل السيرفر
CMD ["node", "backend/server.js"]
