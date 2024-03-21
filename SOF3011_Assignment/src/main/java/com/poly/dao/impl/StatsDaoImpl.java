package com.poly.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.StatsDao;
import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;

public class StatsDaoImpl extends AbstractDao<Object[]> implements StatsDao {

	@Override
	public List<VideoLikedInfo> findeVideoLikedInfo() {
		String sql = "SELECT v.id, v.title, v.href, SUM(CAST(h.isLiked AS int)) totalLike,"
				+ " MIN(h.likedDate) as oldestDate, MAX(h.likedDate) as newestDate"
				+ " FROM Video v INNER JOIN History h ON  v.id = h.videoId" + " WHERE v.isActive = 1 AND h.isLiked = 1"
				+ " GROUP BY v.id, v.title, v.href" + " ORDER BY SUM(CAST(h.isLiked AS int)) DESC";

		List<Object[]> objects = super.findManyByNativeQuery(sql);

		List<VideoLikedInfo> result = new ArrayList<VideoLikedInfo>();

		objects.forEach(object -> {
			VideoLikedInfo videoLikedInfo = new VideoLikedInfo();

			videoLikedInfo.setVideoId((Integer) object[0]);
			videoLikedInfo.setTitle((String) object[1]);
			videoLikedInfo.setHref((String) object[2]);
			videoLikedInfo.setTotalLike(object[3] == null ? 0 : (Integer) object[3]);
			videoLikedInfo.setOldestDate((Date) object[4]);
			videoLikedInfo.setNewestDate((Date) object[5]);

			result.add(videoLikedInfo);
		});

		return result;
	}

	@Override
	public List<UserLikedInfo> findUserLikedInfoByVideoHref(String href) {
		String sql = "SELECT u.username, u.email, h.likedDate"
				+ " FROM [User] u INNER JOIN History h ON u.id = h.userId" + " INNER JOIN Video v ON v.id = h.videoId"
				+ " WHERE u.isActive = 1 AND h.isLiked = 1 AND v.href=?0";
		List<Object[]> objects = super.findManyByNativeQuery(sql, href);
		List<UserLikedInfo> result = new ArrayList<UserLikedInfo>();

		objects.forEach(object -> {
			UserLikedInfo user = new UserLikedInfo();

			user.setUsername((String) object[0]);
			user.setEmail((String) object[1]);
			user.setLikedDate((Date) object[2]);

			result.add(user);
		});

		return result;
	}

	@Override
	public List<VideoSharedInfo> findVideoSharedInfo() {
		String sql = "SELECT DISTINCT v.title, v.href" + " FROM Video v INNER JOIN Share s ON v.id = s.videoId"
				+ " WHERE v.isActive = 1";
		List<Object[]> objects = super.findManyByNativeQuery(sql);

		List<VideoSharedInfo> result = new ArrayList<VideoSharedInfo>();
		
		objects.forEach(object -> {
			VideoSharedInfo video = new VideoSharedInfo();
			
			video.setTitle((String) object[0]);
			video.setHref((String) object[1]);
			
			result.add(video);
		});
		
		return result;
	}

	@Override
	public List<VideoSharedInfo> findVideoSharedInfoByVideoHref(String href) {
		String sql = "SELECT v.title, v.href, u.username, u.email, s.email AS receiverEmail, s.sharedDate"
				+ " FROM [User] u INNER JOIN Share s ON u.id = s.userId"
				+ " INNER JOIN Video v ON v.id = s.videoId"
				+ " WHERE u.isActive = 1 AND v.isActive = 1 AND v.href = ?0";
		List<Object[]> objects = super.findManyByNativeQuery(sql, href);
		
		List<VideoSharedInfo> result = new ArrayList<VideoSharedInfo>();
		
		objects.forEach(object -> {
			VideoSharedInfo video = new VideoSharedInfo();
			
			video.setTitle((String) object[0]);
			video.setHref((String) object[1]);
			video.setUsername((String) object[2]);
			video.setSenderEmail((String) object[3]);
			video.setReciverEmail((String) object[4]);
			video.setSharedDate((Date) object[5]);
			
			result.add(video);
			
		});
		return result;
	}

}
