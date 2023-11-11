#!/bin/bash
docker pull osrf/ros:humble-desktop
docker build -t hsr_sim:humble .