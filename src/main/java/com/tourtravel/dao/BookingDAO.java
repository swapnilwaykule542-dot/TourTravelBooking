package com.tourtravel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tourtravel.model.Booking;
import com.tourtravel.util.DBConnection;

public class BookingDAO {

    public boolean createBooking(Booking booking) {

        String checkSql =
                "SELECT available_seats "
              + "FROM tour_packages "
              + "WHERE package_id = ?";

        String bookingSql =
                "INSERT INTO bookings "
              + "(user_id, package_id, booking_date, number_of_people, "
              + "total_amount, status) "
              + "VALUES (?, ?, ?, ?, ?, ?)";

        String updateSql =
                "UPDATE tour_packages "
              + "SET available_seats = available_seats - ? "
              + "WHERE package_id = ?";

        try (Connection connection =
                     DBConnection.getConnection()) {

            connection.setAutoCommit(false);

            try (PreparedStatement checkStatement =
                         connection.prepareStatement(checkSql)) {

                checkStatement.setInt(
                        1,
                        booking.getPackageId());

                ResultSet resultSet =
                        checkStatement.executeQuery();

                if (!resultSet.next()) {

                    connection.rollback();
                    return false;
                }

                int availableSeats =
                        resultSet.getInt("available_seats");

                if (booking.getNumberOfPeople() <= 0 ||
                    booking.getNumberOfPeople() > availableSeats) {

                    connection.rollback();
                    return false;
                }
            }

            try (PreparedStatement bookingStatement =
                         connection.prepareStatement(bookingSql)) {

                bookingStatement.setInt(
                        1,
                        booking.getUserId());

                bookingStatement.setInt(
                        2,
                        booking.getPackageId());

                bookingStatement.setString(
                        3,
                        booking.getBookingDate());

                bookingStatement.setInt(
                        4,
                        booking.getNumberOfPeople());

                bookingStatement.setDouble(
                        5,
                        booking.getTotalAmount());

                bookingStatement.setString(
                        6,
                        booking.getStatus());

                int result =
                        bookingStatement.executeUpdate();

                if (result <= 0) {

                    connection.rollback();
                    return false;
                }
            }

            try (PreparedStatement updateStatement =
                         connection.prepareStatement(updateSql)) {

                updateStatement.setInt(
                        1,
                        booking.getNumberOfPeople());

                updateStatement.setInt(
                        2,
                        booking.getPackageId());

                updateStatement.executeUpdate();
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }

    public List<Booking> getBookingsByUser(int userId) {

        List<Booking> bookings =
                new ArrayList<>();

        String sql =
                "SELECT * FROM bookings "
              + "WHERE user_id = ? "
              + "ORDER BY booking_id DESC";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(
                    1,
                    userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Booking booking =
                        new Booking();

                booking.setBookingId(
                        resultSet.getInt("booking_id"));

                booking.setUserId(
                        resultSet.getInt("user_id"));

                booking.setPackageId(
                        resultSet.getInt("package_id"));

                booking.setBookingDate(
                        resultSet.getString("booking_date"));

                booking.setNumberOfPeople(
                        resultSet.getInt("number_of_people"));

                booking.setTotalAmount(
                        resultSet.getDouble("total_amount"));

                booking.setStatus(
                        resultSet.getString("status"));

                bookings.add(booking);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return bookings;
    }

    public boolean cancelBooking(int bookingId, int userId) {

        String selectSql =
                "SELECT package_id, number_of_people, status "
              + "FROM bookings "
              + "WHERE booking_id = ? AND user_id = ?";

        String updateBookingSql =
                "UPDATE bookings "
              + "SET status = 'Cancelled' "
              + "WHERE booking_id = ? AND user_id = ? "
              + "AND status <> 'Cancelled'";

        String updateSeatsSql =
                "UPDATE tour_packages "
              + "SET available_seats = available_seats + ? "
              + "WHERE package_id = ?";

        try (Connection connection =
                     DBConnection.getConnection()) {

            connection.setAutoCommit(false);

            int packageId;
            int numberOfPeople;
            String status;

            try (PreparedStatement selectStatement =
                         connection.prepareStatement(selectSql)) {

                selectStatement.setInt(
                        1,
                        bookingId);

                selectStatement.setInt(
                        2,
                        userId);

                ResultSet resultSet =
                        selectStatement.executeQuery();

                if (!resultSet.next()) {

                    connection.rollback();
                    return false;
                }

                packageId =
                        resultSet.getInt("package_id");

                numberOfPeople =
                        resultSet.getInt("number_of_people");

                status =
                        resultSet.getString("status");
            }

            if ("Cancelled".equalsIgnoreCase(status)) {

                connection.rollback();
                return false;
            }

            try (PreparedStatement updateBookingStatement =
                         connection.prepareStatement(
                                 updateBookingSql)) {

                updateBookingStatement.setInt(
                        1,
                        bookingId);

                updateBookingStatement.setInt(
                        2,
                        userId);

                int result =
                        updateBookingStatement.executeUpdate();

                if (result <= 0) {

                    connection.rollback();
                    return false;
                }
            }

            try (PreparedStatement updateSeatsStatement =
                         connection.prepareStatement(
                                 updateSeatsSql)) {

                updateSeatsStatement.setInt(
                        1,
                        numberOfPeople);

                updateSeatsStatement.setInt(
                        2,
                        packageId);

                updateSeatsStatement.executeUpdate();
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}