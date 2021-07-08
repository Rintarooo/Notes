/* 
https://www.ybliu.com/2020/07/ros-how-to-read-and-show-image-from-bag.html
http://docs.ros.org/diamondback/api/rosbag/html/c++/classrosbag_1_1MessageInstance.html
*/
#include <iostream>
#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/CameraInfo.h>

#include <opencv2/core/core.hpp>
// #include <opencv2/core/operations.hpp>
#include <opencv2/highgui/highgui.hpp>



int main(int argc, char** argv)
{
    std::cout << "Read image from bag file" << std::endl;
    std::cout << "Please set image_topic_name and bagfile_name" << std::endl;

    std::string image_topic_name = "/camera/rgb/image_color";
    std::string bagfile_name = "/home/yubao/data/Dataset/TUM/freiburg3/rgbd_dataset_freiburg3_walking_xyz.bag";
    std::cout << "topic name: " << image_topic_name << std::endl;

    cv::Mat image;
    

    // https://www.fatalerrors.org/a/collecting-bag-s-of-point-cloud-images-and-extracting-information-using-ros.html
    // ros::NodeHandle nh;
    // image_transport::ImageTransport it(nh);
    // image_transport::Publisher pub = it.advertise("velodyne/image", 1);
 
 

    rosbag::Bag bag;
    bag.open(bagfile_name, rosbag::bagmode::Read);
    for (rosbag::MessageInstance const m : rosbag::View(bag)) {
        // fetch image topic name
        
        // std::string imgTopic = m.getTopic();
        // if (image_topic_name == imgTopic) {
        if (m.getTopic() == image_topic_name) {
            try {
                sensor_msgs::ImageConstPtr imgMsgPtr = m.instantiate<sensor_msgs::image>();
                
                // if(nh.ok()){
                // pub.publish(imgMsgPtr);
                // }
                

                image = cv_bridge::toCvCopy(imgMsgPtr)->image;
            } catch (cv_bridge::Exception& e) {
                ROS_ERROR("--- Image convert error ---");
            }
            cv::circle(image, cv::Point(image.cols/ 2, image.rows/ 2), 10, cv::Scalar(255, 0, 255), 3);
            cv::imshow("image", image);
            cv::waitKey(1);
        }
    }

    bag.close();
    return 0;
}