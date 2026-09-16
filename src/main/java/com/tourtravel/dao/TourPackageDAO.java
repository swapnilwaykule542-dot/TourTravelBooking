package com.tourtravel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tourtravel.model.TourPackage;
import com.tourtravel.util.DBConnection;

public class TourPackageDAO {

    public List<TourPackage> getAllPackages() {

        List<TourPackage> packages = new ArrayList<>();

        String sql = "SELECT * FROM tour_packages";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                TourPackage tourPackage =
                        new TourPackage();

                tourPackage.setPackageId(
                        resultSet.getInt("package_id"));

                tourPackage.setPackageName(
                        resultSet.getString("package_name"));

                tourPackage.setDestination(
                        resultSet.getString("destination"));

                tourPackage.setDescription(
                        resultSet.getString("description"));

                tourPackage.setDuration(
                        resultSet.getString("duration"));

                tourPackage.setPrice(
                        resultSet.getDouble("price"));

                tourPackage.setAvailableSeats(
                        resultSet.getInt("available_seats"));

                tourPackage.setImage(
                        resultSet.getString("image"));

                packages.add(tourPackage);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

            System.out.println(
                    "Total packages found: "
                    + packages.size());

        } catch (Exception e) {

            System.out.println(
                    "Error loading tour packages:");

            e.printStackTrace();
        }

        return packages;
    }
}