####################################
# File name: listings.py           #
# Description:
# Author: Team-13                  #
# Submission: Spring-2019          #
# Instructor: Dragutin Petkovic    #
####################################
from ..db import DButils


def get_all_listings(price_low, price_high, size_low, size_high, distance_low, distance_high, listing_type, sort, search_key):
    listings = DButils.get_all_listings(price_low, price_high, size_low, size_high, distance_low, distance_high, listing_type, search_key)
    # print(listings)
    # print(listings[0][3])
    # print(sort)
    if sort == '1':
        listings.sort(key=price_sort)
    elif sort == '2':
        listings.sort(key=price_sort, reverse=True)
    elif sort == '3':
        listings.sort(key=size_sort)
    elif sort == '4':
        listings.sort(key=size_sort, reverse=True)
    elif sort == '5':
        listings.sort(key=distance_sort)
    elif sort == '6':
        listings.sort(key=distance_sort, reverse=True)
    # print(listings)
    return listings


def price_sort(e):
    # print(e[3])
    return float(e[5])


def size_sort(e):
    return float(e[6])


def distance_sort(e):
    return float(e[7])


def get_listings_by_userid(user_id, sort):
    listings = DButils.get_listings_by_userid(user_id)
    if sort == '1':
        listings.sort(key=price_sort)
    elif sort == '2':
        listings.sort(key=price_sort, reverse=True)
    elif sort == '3':
        listings.sort(key=size_sort)
    elif sort == '4':
        listings.sort(key=size_sort, reverse=True)
    elif sort == '5':
        listings.sort(key=distance_sort)
    elif sort == '6':
        listings.sort(key=distance_sort, reverse=True)
    # print(listings)
    return listings


def get_listing_by_houseid(house_id):
    return DButils.get_listing_by_houseid(house_id)


def add_a_new_listing(user_id, house_name, type, description, price, size, distance, number, street, city, state, zipcode, image_url, bedroom_count, bathroom_count, parking_count):
    DButils.create_new_listing(user_id, house_name, type, description, price, size, distance, number, street, city, state, zipcode, image_url, bedroom_count, bathroom_count, parking_count)


def delete_listing(house_id):
    DButils.delete_listing(house_id)