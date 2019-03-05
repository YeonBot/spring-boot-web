package com.springboot.web.problem.controller;

import com.springboot.web.Board.Date.ConverterTime;
import com.springboot.web.Board.Date.TimeDifference;
import com.springboot.web.problem.SubmitClient;
import com.springboot.web.problem.domain.Problem;
import com.springboot.web.problem.domain.ProblemStatus;
import com.springboot.web.problem.repository.ProblemRepository;
import com.springboot.web.problem.repository.ProblemStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/problem/*")
public class problemController {

    @Autowired
    ProblemRepository problemRepository;

    @Autowired
    ProblemStatusRepository problemStatusRepository;

    @Autowired
    SubmitClient submitClient;

    TimeDifference timeDifference = new TimeDifference();

    @GetMapping("/problemset")
    public ModelAndView problemset() {

        List<Problem> problemList = problemRepository.findAllOrderByDesc();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("problem/problemset");
        mv.addObject("problemList", problemList);

        return mv;
    }

    //문제 하나를 클릭했을 때 처리
    //read,GET 요청이 들어오면 자세히 보여주기
    @RequestMapping(value = "/proView/{proNo}", method = RequestMethod.GET)
    public ModelAndView proView(@PathVariable("proNo") long proNo) throws ParseException {

        Optional<Problem> p = problemRepository.findById(proNo);
        Problem problem = p.get();

        //Model 객체를 파라미터로 받으면-> 데이터를 뷰에 넘길수 있음 or
        //ModelAndView -> 데이터와 뷰를 동시에 설정이 가능

        ModelAndView mv = new ModelAndView();
        mv.setViewName("problem/proView");

        mv.addObject("problem", problem);

        return mv;
    }

    //문제 제출을 클릭했을 때 처리
    //read,GET 요청이 들어오면 자세히 보여주기
    @RequestMapping(value = "/submit/{proNo}", method = RequestMethod.GET)
    public ModelAndView submit(@PathVariable("proNo") long proNo) throws ParseException {

        Optional<Problem> p = problemRepository.findById(proNo);
        Problem problem = p.get();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("problem/submit");
        mv.addObject("problem", problem);

        return mv;
    }

    //사용자가 문제를 제출 했을 경우 데이터 베이스에 값을 저장 한후 , 소켓 통신으로 채점 서버에 알려준다.
    @RequestMapping(value = "/problem/compile", method = RequestMethod.POST)
    public ModelAndView compile(ProblemStatus problemStatus) throws ParseException {

        //TODO : security 처리 후 사용자 아이디 받아와서 처리
        problemStatus.setEmail("wwlee94");
        //현재 시간 추가하기
        ConverterTime converterTime = new ConverterTime();
        String date = converterTime.getStringDateTime();
        problemStatus.setDateTime(date);

        //DB에게 source 저장 후
        problemStatusRepository.save(problemStatus);

        List<ProblemStatus> psList = problemStatusRepository.findByEmailAndProNo(problemStatus.getEmail(),problemStatus.getProNo());

        for (int i = 0; i < psList.size(); i++) {
            int result = psList.get(i).getResult();
            //setResult,setStrResult
            psList.get(i).setResult(result);
        }

        timeDifference.compileRealTimeDifference(psList);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("problem/compileList");
        mv.addObject("compileList", psList);

        return mv;
    }

    @RequestMapping(value = "/compileList", method = RequestMethod.GET)
    public ModelAndView compileList() throws ParseException {
        List<ProblemStatus> psList = problemStatusRepository.findAll();

        for (int i = 0; i < psList.size(); i++) {

            int result = psList.get(i).getResult();
            //setResult,setStrResult
            psList.get(i).setResult(result);
        }

        timeDifference.compileRealTimeDifference(psList);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("problem/compileList");
        mv.addObject("compileList", psList);

        return mv;
    }

    //compile/list/realTime -> list 화면의 실시간 시간변경
    //GET으로 하면 안가져와짐 POST로만
    //RequestParam -> 안가져와짐 // ->RequestBody OK
    //int bno = Integer.valueOf(String.valueOf(list.get(i).bno)) 변수 가져다 쓰려면 이렇게해야 오류 안남
    @RequestMapping(value = "/compileList/realTime", method = RequestMethod.POST)
    @ResponseBody
    public List<Map> listRealTime(@RequestBody Map<String, Object> map) throws ParseException {
        List<Map> list = (List) map.get("psList");

        timeDifference.listRealTimeDifference(list);

        ///TODO:result 실시간 업데이트 효율적으로 어케..?

        //list 안의 값을 바꾸고 map을 넘겨줘도 바꿔서 넘겨짐
        return list;
    }
}
