# **Fleet Management System Documentation**

---

## **Introduction**

The Fleet Management System is a web application designed to help transportation companies efficiently manage their vehicles, drivers, and logistics. The system is built using **Next.js** for the frontend and **PHP** for the backend, with data stored in a **MySQL** database. It enables users to perform tasks such as vehicle and driver management, route planning, fuel tracking, and reporting.

---

## **System Requirements**

### **Frontend (Next.js)**
- **Node.js** (v14 or above)
- Package Manager: **npm** or **yarn**
- Framework: **Next.js**
- Libraries: 
  - Axios (for API communication)
  - Chart.js (for data visualization)
  - Tailwind CSS (for styling)

### **Backend (PHP)**
- **PHP** (v7.4 or above)
- **MySQL** (v5.7 or above)
- Web Server: **Apache** or **Nginx**
- Tools: **Composer** (for PHP package management)

---

## **Features**

### 1. **Vehicle Management**
- Add, edit, view, or delete vehicles.
- Store details like:
  - Registration number
  - Make and model
  - Insurance expiry
  - Maintenance schedules
- Alerts for upcoming maintenance or expired insurance.

### 2. **Driver Management**
- Maintain detailed driver profiles.
- Assign drivers to vehicles.
- Monitor driver performance (e.g., success rate, fuel efficiency).

### 3. **Route Planning**
- Plan and visualize optimized routes.
- Save frequently used routes.
- Integrate with Google Maps API for real-time routing and traffic analysis.

### 4. **Fuel Tracking**
- Log fuel consumption per trip.
- Calculate vehicle fuel efficiency.
- Generate reports on fuel costs and consumption patterns.

### 5. **Reporting Dashboard**
- Visualize key metrics:
  - Active vehicles and drivers
  - Fuel consumption trends
  - Maintenance and insurance alerts
- Export data as CSV or PDF.

---

## **Project Structure**

### **Frontend (Next.js)**

```plaintext
project-root/
├── app/
│   ├── vehicles/
│   │   └── page.tsx         # Vehicle management page
│   ├── drivers/
│   │   └── page.tsx         # Driver management page
│   ├── routes/
│   │   └── page.tsx         # Route planning page
│   ├── reports/
│   │   └── page.tsx         # Reports page
│   └── components/
│       ├── VehicleCard.tsx  # Component to display vehicle details
│       ├── DriverCard.tsx   # Component to display driver details
│       ├── Map.tsx          # Component to display route map
│       └── FuelChart.tsx    # Component to visualize fuel data
├── public/
├── styles/
└── tailwind.config.js
```

### **Backend (PHP)**

```plaintext
backend/
├── api/
│   ├── vehicles.php         # CRUD API for vehicles
│   ├── drivers.php          # CRUD API for drivers
│   ├── routes.php           # Route management API
│   └── reports.php          # Reports API
├── config/
│   └── database.php         # Database connection script
├── index.php                # Main entry point
└── .htaccess                # URL rewriting (optional)
```

---

## **Database Schema**

### **Vehicles Table**
```sql
CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(50) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    insurance_expiry DATE NOT NULL,
    last_maintenance DATE NOT NULL
);
```

### **Drivers Table**
```sql
CREATE TABLE drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
);
```

### **Routes Table**
```sql
CREATE TABLE routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    driver_id INT NOT NULL,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    route_data JSON NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (driver_id) REFERENCES drivers(id)
);
```

### **Fuel Logs Table**
```sql
CREATE TABLE fuel_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    trip_id INT NOT NULL,
    fuel_used DECIMAL(10, 2) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);
```

---

## **API Endpoints**

### **Vehicles API (`vehicles.php`)**
- `GET /vehicles`: Fetch all vehicles.
- `POST /vehicles`: Add a new vehicle.
- `PUT /vehicles/{id}`: Update vehicle details.
- `DELETE /vehicles/{id}`: Delete a vehicle.

### **Drivers API (`drivers.php`)**
- `GET /drivers`: Fetch all drivers.
- `POST /drivers`: Add a new driver.
- `PUT /drivers/{id}`: Update driver details.
- `DELETE /drivers/{id}`: Delete a driver.

### **Routes API (`routes.php`)**
- `GET /routes`: Fetch all routes.
- `POST /routes`: Add a new route.
- `PUT /routes/{id}`: Update route details.
- `DELETE /routes/{id}`: Delete a route.

### **Reports API (`reports.php`)**
- `GET /reports`: Generate and fetch system reports.

---

## **Installation and Setup**

### **Frontend Setup**
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd fleet-management-frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the development server:
   ```bash
   npm run dev
   ```
4. Open the app in your browser at `http://localhost:3000`.

### **Backend Setup**
1. Set up a PHP environment using XAMPP or WAMP.
2. Create a MySQL database and import the provided schema.
3. Clone the repository:
   ```bash
   git clone <repository-url>
   cd fleet-management-backend
   ```
4. Update the database configuration in `config/database.php`:
   ```php
   <?php
   $conn = new mysqli("localhost", "root", "", "fleet_management");
   if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
   }
   ?>
   ```
5. Start the PHP server:
   ```bash
   php -S localhost:8000
   ```

---

## **Usage Instructions**
1. **Add Vehicles**: Navigate to the "Vehicles" page and add vehicle details.
2. **Manage Drivers**: Go to the "Drivers" page to add or update driver profiles.
3. **Plan Routes**: Use the "Routes" page to plan and save routes.
4. **View Reports**: Access the "Reports" page to view system analytics.

---

## **Future Enhancements**
- Real-time GPS tracking integration.
- Push notifications for maintenance alerts.
- Advanced analytics and AI-driven route optimization.

---

Would you like me to help with anything specific, such as deploying this system or creating test cases?