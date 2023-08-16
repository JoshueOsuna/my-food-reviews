import React, {useState, useEffect, Fragment} from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import Header from "./Header";
import styled from "styled-components";
import ReviewForm from "./ReviewForm";
import Review from "./Review";
import Navbar from "../Navbar/navbar";

const Wrapper = styled.div`
  margin-left: auto;
  margin-right: auto;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
`
const Column = styled.div`
  background: #fff;
  height: 100vh;
  overflow: scroll;
  &:last-child {
    background: #000;
  }
`
const Main = styled.div`
  padding-left: 50px;
`

const Restaurant = () => {
  const [restaurant, setRestaurant] = useState({});
  const [reviews, setReviews] = useState([]);
  const [review, setReview] = useState({
    title: "",
    description: "",
    score: 0,
  });
  const [loaded, setLoaded] = useState(false);
  const slug = useParams().slug;

  useEffect(() => {
    const url = `/api/v1/restaurants/${slug}`;

    axios.get(url)
      .then(response => {
        setRestaurant(response.data)
        setReviews(response.data.included)
        setLoaded(true)
      })
      .catch(response => console.log(response))
  }, []);

  useEffect(() => {
    const url = `/api/v1/restaurants/${slug}`;

    axios.get(url)
      .then(response => {
        setRestaurant(response.data)
      })
      .catch(response => console.log(response))
  }, [reviews]);

  const handleChange = (e) => {
    e.preventDefault();

    setReview(Object.assign({}, review, {[e.target.name]: e.target.value}))
  }

  const handleSubmit = (e) => {
    e.preventDefault();

    const csrfToken = document.querySelector('[name=csrf-token]').content;
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken;
    const restaurant_id = restaurant.data.id;
    axios.post('/api/v1/reviews', {review, restaurant_id})
      .then(response => {
        setReviews([...reviews, response.data.data])
        setReview({title: '', description: '', score: 0})
      })
      .catch(response => {
        console.log(response)
      })
  }

  const setRating = (score, e) => {
    e.preventDefault();

    setReview({...review, score})
  }

  const handleEdit = (id, e, editedReview) => {
    e.preventDefault();

    const csrfToken = document.querySelector('[name=csrf-token]').content;
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken;
    axios.put(`/api/v1/reviews/${id}`, editedReview)
      .then(response => {
        setReviews(
          reviews.map((item) => (item.id === id ? response.data.data : item))
        );
        setReview({title: '', description: '', score: 0})
      })
      .catch(response => {
        console.log(response)
      })
  }

  const handleDestroy = (id, e) => {
    e.preventDefault();

    const csrfToken = document.querySelector('[name=csrf-token]').content;
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken;
    axios.delete(`/api/v1/reviews/${id}`)
      .then(response => {
        setReviews(reviews.filter(item => item.id !== id))
      })
      .catch(response => {
        console.log(response)
      })
  }

  if (loaded) {
    reviews_list = reviews.map((item, index) => {
      return (
        <Review
          key={item.id}
          attributes={item.attributes}
          handleEdit={handleEdit}
          handleDestroy={handleDestroy}
          id={item.id}
        />
      )
    })
  }

  return (
    <Fragment>
      <Navbar />
      <Wrapper>
        {loaded && (
          <Fragment>
            <Column>
              <Main>
                <Header
                  attributes={restaurant.data.attributes}
                  reviews={restaurant.included}
                />
                {reviews_list}
              </Main>
            </Column>
            <Column>
              <ReviewForm
                handleChange={handleChange}
                handleSubmit={handleSubmit}
                setRating={setRating}
                attributes={restaurant.data.attributes}
                review={review}
              />
            </Column>
          </Fragment>
        )}
      </Wrapper>
    </Fragment>
  );
  
};

export default Restaurant;
