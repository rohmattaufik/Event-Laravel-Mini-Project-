# EVENT LARAVEL SERVICE API (Mini Project)
Pada proyek ini dikembangkan Web Service API untuk aplikasi sebuah Event. Sebuah Event mempunya Location dan Schedule. Selain itu ada model Ticket, dimana setiap Event mungkin memiliki banyak tipe Ticket. User dapat melakukan Transaction pada sebuah Event. Setiap Transaction hanya boleh dilakukan untuk satu Event saja. Namun, User dapat membeli beberapa tipe Ticket dalam sebuah Transaction.

### Service

Berikut merupakan service dan akses yang ada pada API ini.

| Service | Method |Akses | 
| ------ | ------ | ------ | 
| Create Event | POST | /api/event/create | 
| Create Location | POST | /api/location/create |
| Create Ticket	 | POST | /api/event/ticket/create |
| Get Event | GET | /api/event/get_info |
| Purchase Ticket | POST | /api/transaction/purchase |
| Transcation Detail | GET | /api/transaction/get_info	 |

### Create Event
Data yang dimasukkan untuk create event adalah :
- name (text)
- description (text)
- id_location (numeric)
- date_start (Date, format:Y-m-d)
- date_close (Date, format:Y-m-d)
- time_start (Date, format:H:i:s)
- time_close (Date_format:H:i:s)
- image (File, format:jpeg,jpg,png)
contoh :
![contoh](http://resume.rohmattaufik.my.id/event_create.PNG)

### Create Location
Data yang dimasukkan untuk create location adalah :
- location (text)
- city (text)
- longitude (numeric)
- latitude (numeric)
contoh :
![contoh](http://resume.rohmattaufik.my.id/location_create.PNG)

### Create Ticket
Data yang dimasukkan untuk create ticket adalah :
- id_event (numeric)
- name (text)
- detail (text)
- quantity (numeric)
- price (numeric)
contoh :
![contoh](http://resume.rohmattaufik.my.id/ticket_create.PNG)

### Purchase Ticket
Data yang dimasukkan untuk purchase ticket adalah :
- id_user (numeric)
- id_event (numeric)
- tickets (array of (id tiket, quantity))
contoh :
![contoh](http://resume.rohmattaufik.my.id/transaction_purchase.PNG)

### Get Event
Menambahkan id event pada url
contoh :
![contoh](http://resume.rohmattaufik.my.id/get_event.PNG)

### Transcation Detail
Menambahkan id transaction pada url
contoh :
![contoh](http://resume.rohmattaufik.my.id/transaction_info.PNG)